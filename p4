interface MessageService {
    void sendMessage(String message, String recipient);
}

class EmailService implements MessageService {
    public void sendMessage(String message, String recipient) {
        System.out.println("Email sent to " + recipient + ": " + message);
    }
}

class Notification {
    private MessageService messageService;

    public Notification(MessageService messageService) {
        this.messageService = messageService;
    }

    public void notifyUser(String message, String recipient) {
        messageService.sendMessage(message, recipient);
    }
}

public class Main {
    public static void main(String[] args) {
        Notification notification = new Notification(new EmailService());
        notification.notifyUser("Hello!", "user@example.com");
    }
}
