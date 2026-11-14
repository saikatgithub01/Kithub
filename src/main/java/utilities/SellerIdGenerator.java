package utilities;

import java.security.SecureRandom;

public class SellerIdGenerator {
	
	private static final String CHARS = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
    private static final SecureRandom random = new SecureRandom();

    public static String generateKspId() {
        return "KSP-" + randomBlock() + "-" + randomBlock();
    }

    private static String randomBlock() {
        StringBuilder sb = new StringBuilder(4);
        for (int i = 0; i < 4; i++) {
            sb.append(CHARS.charAt(random.nextInt(CHARS.length())));
        }
        return sb.toString();
    }

}
