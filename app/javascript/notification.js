function updateNotificationCount() {
    console.log("Updating notification count...");
    $.ajax({
        url: "<%= admin_notifications_path %>",
        success: function(data) {
            console.log("Data received:", data);
            $("#notification-icon").text(data);
        }
    });
}

$(document).ready(function() {
    updateNotificationCount();
    setInterval(updateNotificationCount, 10000); // Actualiza cada 10 segundos
});

