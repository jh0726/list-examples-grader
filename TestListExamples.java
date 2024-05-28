import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }

  @Test(timeout = 500) 
  public void testMerge() {
    List<String> left2 = Arrays.asList("1", "2", "3");
    List<String> right2 = Arrays.asList("1", "2", "4");
    List<String> merged = ListExamples.merge(left2, right2);
    List<String> expected = Arrays.asList("1", "1", "2", "2", "3", "4");
    assertEquals(expected, merged);
  }
}
