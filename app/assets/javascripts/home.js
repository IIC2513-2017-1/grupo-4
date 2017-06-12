$(document).on("turbolinks:load", function() {
	var widget = $("#landing-jumbotron"),
		rotador = $("#landing-jumbotron .col-12"),
        mask = $("#jumbotron-mask"),
		left_button = $("#jumbotron-left-ui span"),
		right_button = $("#jumbotron-right-ui span"),
		destacado = rotador.find(".jumbotron-element"),
		destacado_data = {
			width: 1200,
			height: destacado.outerHeight(true),
			current: null,
			visible: null
		},
		functions  = {
			// Move the slideshow forward
			slideForward: function() {
				if(!widget.find(":animated").length && !widget.data("locked")) {
					destacado_data.current = destacado_data.current + destacado_data.visible;		
					mask.animate({marginLeft: -1 * destacado_data.current * destacado_data.width}, 500, function() {
					
						if(destacado_data.current + destacado_data.visible == destacado.length) {
							mask.css("margin-left", -1 * destacado_data.width * destacado_data.visible);
							destacado_data.current = destacado_data.visible;
						}
						
					});
				}
			},
			
			// Move the slideshow back			
			slideBack: function() {
				if(!widget.find(":animated").length && !widget.data("locked")) {
					destacado_data.current = destacado_data.current - destacado_data.visible;		
					mask.animate({marginLeft: -1 * destacado_data.current * destacado_data.width}, 500, function() {
					
						if(destacado_data.current === 0) {					
							mask.css("margin-left", -1 * destacado_data.width * (destacado.length - destacado_data.visible * 2));
							destacado_data.current = destacado.length - destacado_data.visible * 2;						
						}
						
					});
				}
			},
			
			// Function that adds the loop capability
			loopDaSlide: function() {
				this.slideForward();
				timer = setTimeout(function() { functions.loopDaSlide() }, time);
			},
			
			// Function that changes the backgound-position CSS property in the y-axis	
			backgroundPosition: function(element, position) {
				var el = $(element),
					indexOf_ = el.attr("id").indexOf("_"),
					backgroundPosition = el.attr("id").substr(0, indexOf_) + " " + position;
			
				el.find("span").css("background-position", backgroundPosition)
			}
		},
		time = 5000,
		timer;
		
	// Set some init data
	widget.data("locked", false);
	
	destacado_data.current = Math.floor(rotador.width() / destacado_data.width);
	destacado_data.visible = Math.ceil(rotador.width() / destacado_data.width);
		
	// Prepend copies of the 4 last slides	
	destacado.slice(destacado.length - destacado_data.visible, destacado.length).clone().addClass("clones").prependTo(mask);
		
	// Append copies of the 4 first	slides
	destacado.slice(0, destacado_data.visible).clone().addClass("clones").appendTo(mask);
	
	// Scroll to the original position
	mask.css("margin-left", -1 * destacado_data.width * destacado_data.visible);
	destacado = rotador.find(".jumbotron-element");
	
	// Everything ready? Start the slideshow!
	timer = setTimeout(function() { functions.loopDaSlide() }, time);
	
	// Bind click events to both buttons	
	right_button.click(function() {
		functions.slideForward();
		
		clearTimeout(timer);
		timer = setTimeout(function() { functions.loopDaSlide() }, time);
	});
	
	left_button.click(function() {
		functions.slideBack();
		
		clearTimeout(timer);
		timer = setTimeout(function() { functions.loopDaSlide() }, time);
	});
	
	// Hover Stop	
	mask.hover(function() {
		clearTimeout(timer);
		widget.data("locked", true);
	}, function() {
		clearTimeout(timer);
		timer = setTimeout(function() { functions.loopDaSlide() }, time);
		widget.data("locked", false);
	});

	$("#navbar-small-avatar").click(function(e) {
		$("#navbar-dropdown-menu").toggle();
		e.stopPropagation();
	});

	$(document).click(function() {
		$("#navbar-dropdown-menu").hide();
	});
});