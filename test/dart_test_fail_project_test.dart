import 'package:dart_test_fail_project/dart_test_fail_project.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    bool success = tryToCallSomeComponent();
  });
}

bool tryToCallSomeComponent() {
  bool success = true;
  try {
    /**
        begin routine
     */
    doBeginActionWithPotentialException();

    /**
        Exception was not thrown at this point.
        Now we do some intermediate check.
        The result should be valid.
        Otherwise test should report invalid state and report an error.
     */
    expect(calculate(), 42);

    /**
        end routine
     */
    doEndActionWithPotentialException();

    return success;
  } catch (e, s) {
    /**
        Should catch regular exceptions.

        But catches test failures also:
        expect() failed but test passed
     */
    print(e);
    print(s);
  }

  return !success;
}
