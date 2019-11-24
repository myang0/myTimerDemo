const maxMinutes = 60;
const minMinutes = 1;

var minutes = 25;
var totalSeconds;

const maxCancelTime = 10;
var cancelTime = maxCancelTime;

var activeSession = false;

function getMinutes(seconds) {
    var minutes = (seconds - (seconds % 60)) / 60;
    return minutes.toString();
}

function getSeconds(totalSeconds) {
    seconds = totalSeconds % 60;
    if (seconds < 10) {
        return '0' + seconds;
    } else {
        return seconds.toString();
    }
}

$(document).ready(function() {
    var timer = $("#timer");
    var addButton = $("#add-btn");
    var subButton = $("#sub-btn");
    var timeInput = $("#time-input");
    var startButton = $("#start-button");
    var msg = $('#sess-msg');
    var invisBtn = $('#invis-btn-s');

    var fButton = $('#forfeit-btn');
    var cButton = $("#cancel-btn")
    cButton.html("cancel (" + cancelTime + ")");
    
    timer.html(minutes + ':00');

    function endSession() {
        activeSession = false;

        // Show hidden buttons once again
        addButton.slideDown();
        subButton.slideDown();
        timeInput.slideDown();
        startButton.slideDown();
        $("#exit-link").slideDown();

        // Hide session buttons
        cButton.css("display", "none");
        fButton.css("display", "none");

        // Reset cancel timer
        cancelTime = maxCancelTime;
        cButton.html("cancel (" + maxCancelTime + ")");

        // Reset timer display
        timer.html(minutes + ':00');

        // Stop timer
        clearInterval(time);
    }

    function sessionSuccess() {
        endSession();

        // Open the modal, which the user to use to submit their record into the table
        invisBtn.click();
        $("#modal-msg").html("session complete.  you did it!");
        $("#success-field").val(true)
    }

    // Behaviour after every second after starting timer
    function startTimer() {
        time = setInterval(function() {
            if (cancelTime >= -1) {
                timeS = (cancelTime >= 0) ? cancelTime : 0;
                cButton.html("cancel (" + timeS + ")");
                if (cancelTime < 0) {
                    cButton.slideUp();
                }
                cancelTime--;
            }

            if (totalSeconds >= 0) {
                timer.html(getMinutes(totalSeconds) + ':' + getSeconds(totalSeconds));
                totalSeconds--;
            } else if (totalSeconds <= 0) {
                sessionSuccess();
            }
            
        }, 1000);
    }
    
    // Handle any changes to the input field for amount of time
    timeInput.change(function() {
        if (parseInt(timeInput.val()) < minMinutes || parseInt(timeInput.val()) > maxMinutes || !Number.isInteger(Number(timeInput.val()))) {
    
        } else {
            minutes = parseInt(timeInput.val());
            timer.html(timeInput.val() + ':00');
        }
    })
    
    // Click + button, add time
    addButton.click(function() {
        if (minutes < maxMinutes && minutes + 5 < maxMinutes) {
            minutes += 5;
            timeInput.val(minutes);
        }
        
        timer.html(minutes + ':00');
    })
    
    // Click - button, subtract time
    subButton.click(function() {
        if (minutes > minMinutes && minutes - 5 > minMinutes) {
            minutes -= 5;
            timeInput.val(minutes);
        }
    
        timer.html(minutes + ':00');
    })
    
    // Prepare to start a session
    startButton.click(function() {
        // Hide all buttons
        addButton.slideUp();
        subButton.slideUp();
        timeInput.slideUp();
        startButton.slideUp();
        $("#exit-link").slideUp();

        // Show session buttons
        cButton.css("display", "inline");
        fButton.css("display", "inline");

        msg.html('focus.');
        $("#duration-field").val(minutes)

        // Start the timer
        if (!activeSession) {
            startTimer();
            activeSession = true;
            totalSeconds = minutes * 60;
        }
    }) 
    
    fButton.click(function() {
        clearInterval(time);
        $("#modal-msg").html("session terminated.");
    })
    
    // Reset timer
    cButton.click(function() {
        msg.html('start a new session.');
        endSession()
    })
})

