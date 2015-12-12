
var $element1 = $("#button1");
var $element2 = $("#button2");
var $element3 = $("#button3");
var $rect = $("#rect");
var $circle = $("#circle");

// Create the array of Velocity calls
var loadingSequence = [
    { e: $element1, p: { translateX: 100, opacity: 1}, o: { duration: 1000}},
    { e: $element2, p: { translateY: 100, opacity: 1}, o: { duration: 1000}},
    { e: $element3, p: { translateZ: 100, opacity: 1}, o: { duration: 1000}}
];

var loadingSequence2 = [
    { e: $element1, p: { translateX: 100, opacity: 1 }, o: { duration: 1000}},
    { e: $element2, p: { translateX: 200, opacity: 1 }, o: { duration: 1000, sequenceQueue: false}},
    { e: $element3, p: { translateX: 300, opacity: 1 }, o: { duration: 1000}}
];

//$.Velocity.RunSequence(loadingSequence2);

//$element3.velocity({ opacity: 1, scale: 1}, { duration: 500, easing: "ease-in-out"}).velocity({borderWidth: "1rem" }, { delay: 200, easing: "spring", duration: 400 });
//$element.velocity(fadeIn.p, fadeIn.oSlow);
//$element.velocity({ translateX: 100}).velocity({ translateY: 100}).velocity({ translateZ: 100});

$.Velocity.RegisterEffect("shadowIn", {
    defaultDuration: 1000,
    calls: [
        [ { opacity: 1, scale: 1 }, 0.4],
        [ { boxShadowBlur: 50 }, 0.6]
    ]
}).RegisterEffect("shadowOut", {
    defaultDuration: 800, 
    calls: [
        [ { boxShadowBlur: 50 }, 0.2 ],
        [ { opacity: 0, scale: 0 }, 0.8 ]
    ]
});
  
$element3.velocity("shadowIn").velocity("shadowOut");

/*
$("#message").html("This is our new message.").blast({ delimiter: "word" }).css("opacity", 0).velocity("transition.fadeIn", { stagger: 250});

$("#message").velocity("transition.fadeOut", { stagger: 50, backwards: true, complete: function () {
    $("#message").html("This is our new message").blast({ delimiter: "word" }).css("opacity", 0).velocity({ opacity: 1}, { stagger: 50 });
}});
*/
$("#message").blast({ delimiter: "word"}).eq(2).velocity({ opacity: 0 }, function () { $(this).text("running"); }).velocity({ opacity: 1 });
                       
$rect.velocity({ x: 300, y: 300 });
$circle.velocity({ cx: 200, cy: 200, r: 100});
$rect.velocity({ width: 100, height: 100});

$("#circleLeft").velocity({ cx: "-=15px" }, { easing: "spring" });
$("#circleRight").velocity({ cx: "+=15px" }, { easing: "spring" });

$("svg").on("mouseover mouseout", function () {
    $("#circleLeft, #circleRight").velocity("reverse");
});
