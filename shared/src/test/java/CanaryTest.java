import org.junit.Test;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThat;

public class CanaryTest {
    @Test
    public void happyCanary() throws Exception {
        Canary canary = new Canary();
        assertEquals("happyCanary", canary.getStatus());
    }
}
