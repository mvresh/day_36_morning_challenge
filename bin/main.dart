/// Challenge
/// Accounts Merge
// Given a list accounts, each element accounts[i] is a list of strings, where
// the first element accounts[i][0] is a name, and the rest of the elements are
// emails representing emails of the account.
//
// Now, we would like to merge these accounts. Two accounts definitely belong to
// the same person if there is some email that is common to both accounts. Note
// that even if two accounts have the same name, they may belong to different people
// as people could have the same name. A person can have any number of accounts
// initially, but all of their accounts definitely have the same name.
//
// After merging the accounts, return the accounts in the following format: the
// first element of each account is the name, and the rest of the elements are
// emails in sorted order. The accounts themselves can be returned in any order.
/// Example 1:
/// Input:
// accounts = [["John", "johnsmith@mail.com", "john00@mail.com"],
// ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
// ["Mary", "mary@mail.com"]]
/// Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
/// ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]

import "dart:collection";
class Account {
  String accountName;
  List<String> accountEmailIds;
  Account({this.accountName, this.accountEmailIds});

  bool haveCommonEmailIds(Account account1) {
    return account1.accountEmailIds.any((emailId) => this.accountEmailIds.contains(emailId));
  }


}


Account mergeAccounts(Account account1, Account account2) {
  Account mergedAccount = Account();

  if(account1.accountName.contains(account2.accountName)){
    mergedAccount.accountName = account1.accountName;
  }

  else if(account2.accountName.contains(account1.accountName)){
    mergedAccount.accountName = account2.accountName;
  }

  else{
    mergedAccount.accountName = account1.accountName + account2.accountName;
  }

  mergedAccount.accountEmailIds = account1.accountEmailIds.toList()..addAll(account2.accountEmailIds.toList());
  mergedAccount.accountEmailIds = LinkedHashSet<String>.from(mergedAccount.accountEmailIds).toList();

  return mergedAccount;
}

List<String> accountToList(Account account){
  List<String> sameAccountList = [account.accountName];
  sameAccountList.addAll(account.accountEmailIds);
  return sameAccountList;
}

List<Account> normalListToAccountList(List<List<String>> normalList){
  List<Account> accountsList = [];
  for(int i = 0;i<normalList.length;i++){
    Account newAccount = Account();
    newAccount.accountName = normalList[i][0];
    newAccount.accountEmailIds = normalList[i].sublist(1);
    accountsList.add(newAccount);
  }
  return accountsList;
}

List<List<String>> removeDuplicateAccounts(
    List<List<String>> originalAccountsList) {

  List<Account> accountsList = normalListToAccountList(originalAccountsList);
  List<List<String>> finalAccountsList = [];

  for(int i = 0 ; i < accountsList.length ; i++){
    for(int j = i+1; j < accountsList.length ; j++){
      if(accountsList[i].haveCommonEmailIds(accountsList[j])){
        accountsList[i] = mergeAccounts(accountsList[i], accountsList[j]);
        accountsList.removeAt(j);
        j--;

      }
    }
    finalAccountsList.add(accountToList(accountsList[i]));
  }

  return finalAccountsList;
}

main() {
  print(removeDuplicateAccounts([["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],["John", "johnsmith@mail.com", "john00@mail.com"],
    ["Mary", "mary@mail.com"]]));

  print(removeDuplicateAccounts([["John", "j@b.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"], ["John V", "johnsmith@mail.com", "j@b.com"],
    ["Mary", "mary@mail.com"]]));
}
