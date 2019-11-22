import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
    expect(
        removeDuplicateAccounts([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            'John',
            'johnsmith@mail.com',
            'john00@mail.com',
            'john_newyork@mail.com'
          ],
          ['John', 'johnnybravo@mail.com'],
          ['Mary', 'mary@mail.com']
        ]);
  });

  test('Test Case 2', () {
    expect(
        removeDuplicateAccounts([
          ["John", "j@b.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John V", "johnsmith@mail.com", "j@b.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            'John V',
            'j@b.com',
            'john00@mail.com',
            "johnsmith@mail.com"
          ],
          ['John', 'johnnybravo@mail.com'],
          ['Mary', 'mary@mail.com']
        ]);
  });

  test('Test Case 3', () {
    expect(
        removeDuplicateAccounts([
          ["John", "j@b.com", "john00@mail.com"],
          ["John", "j@b.com", "jon00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John V", "johnsmith@mail.com", "j@b.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            'John V',
            'j@b.com',
            'john00@mail.com',
            'jon00@mail.com',
            "johnsmith@mail.com"
          ],
          ['John', 'johnnybravo@mail.com'],
          ['Mary', 'mary@mail.com']
        ]);
  });
}
