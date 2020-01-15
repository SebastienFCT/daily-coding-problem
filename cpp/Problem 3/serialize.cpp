#include <iostream>
#include <string>
#include <sstream>


using namespace std;

// The reason why cpp use pointer is that object is a copy not a reference

struct Node{
	Node* left;
	Node* right;
	string val;
	Node(string value, Node* L = 0, Node* R = 0) : left(L), right(R), val(value) {};  	
};


string serialize(Node* node){
	if(node == 0) return "# ";
	stringstream tmp;
	tmp << node->val << " ";
	tmp << serialize(node->left);
	tmp << serialize(node->right);
	return tmp.str();
}

Node* _de(stringstream& ss){
    string tmp;
    ss >> tmp;
    if(tmp == "#") return 0;
    Node* root = new Node(tmp);
    root->left = _de(ss);
    root->right = _de(ss);
    return root;    
}


Node* deserialize(string line){
    stringstream ss;
    ss << line;
    return _de(ss);
}


int main(){
	Node* node = new Node("root",new Node("left",new Node("left.left")),new Node("right"));	
	cout << serialize(node) << endl;
	string line;
	line = serialize(node);
	Node* out = deserialize(line);
    cout << (out->left->left->val == "left.left");
    
}