    function testing($timer,mydate){
    // Set the date we're counting down to
    var countDownDate = new Date(mydate).getTime();

    // Update the count down every 1 second
    var x = setInterval(function() {

        // Get todays date and time
        var now = new Date().getTime();
        
        // Find the distance between now an the count down date
        var distance = countDownDate - now;
        
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        // Output the result in an element with id="timer"

        $timer.html( "<div class='timercolr'>" + days + "<br><span>Days</span>" + "</div>" + "   " +"<div class='timercolr'>" + hours + "<br><span>Hrs</span>" + "</div>" + "   " + "<div class='timercolr'>" + minutes + "<br><span>Min</span>" + "</div>" + "   " + "<div class='timercolr'>" + seconds + "<br><span>Sec</span>" + "</div>");
        
        // If the count down is over, write some text 
        if (distance < 0) {
            clearInterval(x);
            $timer.html("Timer Up -EVENT EXPIRED");
        }
    }, 1000);
}
jQuery("document").ready(function(){
    var mydate =jQuery('.date').val();
    jQuery(".countdown").each(function(){
        testing(jQuery(this),mydate);
    });
});