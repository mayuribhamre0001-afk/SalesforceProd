public class Passwordchecker 
{    
    public static String validatePassword(String password) {
        if (String.isBlank(password)) {
            return 'Invalid Password';
        }
        
        // Rule checks
        Boolean hasUpper    = Pattern.matches('.*[A-Z].*', password);
        Boolean hasLower    = Pattern.matches('.*[a-z].*', password);
        Boolean hasNumber   = Pattern.matches('.*[0-9].*', password);
        Boolean hasSpecial  = Pattern.matches('.*[^A-Za-z0-9].*', password);
        Boolean minLength   = password.length() >= 8;
        
        if (hasUpper && hasLower && hasNumber && hasSpecial && minLength) {
            return 'Valid Password';
        } else {
            return 'Invalid Password';
        }
    }
}