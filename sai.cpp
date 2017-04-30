#include "iostream"
#include "map"
using namespace std;
int main(){
	cout<<"Hello World\n";
	map<char, int> a;
	a['a']=1;
	a['b']=2;
	for(auto i:a){
		cout<<i.first<<"\t";
		cout<<i.second<<endl;
	}
}
