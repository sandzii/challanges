import java.security.MessageDigest;

String inorder[], preorder[];
String[] inorderFile;
String[] preorderFile;

int preIndex = 0; 

PrintWriter output;
StringBuffer outStr = new StringBuffer();

boolean TEST_MODE = false;

void setup() {   
   if (TEST_MODE){
     // console shoud be: 111312984, out.txt: 004c0b214b7b88203f33cdf32141a969
     inorderFile = loadStrings("testInorder.txt");
     preorderFile = loadStrings("testPreorder.txt");
   }
   else{
     inorderFile = loadStrings("inorder.txt");
     preorderFile = loadStrings("preorder.txt");
   }
   
   inorder = split(inorderFile[0], ' ');
   preorder = split(preorderFile[0], ' ');
   
   BinaryTree tree = new BinaryTree();
   int len = inorder.length;   
   Node root = tree.buildTree(inorder, preorder, 0, len - 1);    
   
   // print results
   tree.printLeafNodes(root);     // print leaves to outStr   
   print(outStr);                 // print leaves to console
   printMD5(outStr.toString());   // print md5 to out.txt
}

void printMD5(String out){
  output = createWriter("out.txt");
  byte[] md5hash = messageDigest(out, "MD5");
  String md5string = "";
  for(int i = 0; i < md5hash.length; i++) md5string += (hex(md5hash[i], 2));
  output.print(md5string.toLowerCase());
  output.flush();
  output.close();
}

byte[] messageDigest(String message, String algorithm) {
  try {
    MessageDigest md = MessageDigest.getInstance(algorithm);
    md.update(message.getBytes());
    return md.digest();
  } 
  catch(java.security.NoSuchAlgorithmException e) {
      println(e.getMessage());
      return null;
  }
}