$(document).ready(function() {
	$("header > nav.primary ul li").each(function() {
		$(this).hover(function() {
			$(this).find(".tertiary") && ($(this).find(".tertiary").addClass("on"),
				$(this).find(".theaterInfo").addClass("on"))
		}, function() {
			$(this).find(".tertiary") && ($(this).find(".tertiary").removeClass("on"),
				$(this).find(".theaterInfo").removeClass("on"))
		})
	});
	$("header").on("click", "nav.secondary ul li.username a", function() {
		return $(this).find("> ul.sub") && ($(this).next().toggleClass("on"),
			$(this).toggleClass("on"),
			$(this).attr("href") != "#" && $(this).trigger("click")),
			!1
	});
});

$(document).ready(function() {
	$("nav.primary ul li").each(function() {
		$(this).hover(function() {
			$(this).find(".tertiary") && ($(this).find(".tertiary").addClass("on"),
				$(this).find(".theaterInfo").addClass("on"))
		}, function() {
			$(this).find(".tertiary") && ($(this).find(".tertiary").removeClass("on"),
				$(this).find(".theaterInfo").removeClass("on"))
		})
	});
	$("header").on("click", "nav.secondary ul li.username a", function() {
		return $(this).find("> ul.sub") && ($(this).next().toggleClass("on"),
			$(this).toggleClass("on"),
			$(this).attr("href") != "#" && $(this).trigger("click")),
			!1
	});
	$(".top-banner").length && ($.cookie("top-banner-hidden") == 1 && $(".top-banner").hide(),
		$(".top-banner .btn-close").click(function() {
			$.cookie("top-banner-hidden", 1, {
				expires: 1
			});
			$(".top-banner").hide()
		}));
});


