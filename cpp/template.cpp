#include<bits/stdc++.h>
using namespace std;
template<integral T,T Q=2>constexpr T inf=numeric_limits<T>::max()/Q-1;
template<class T,class S=T>inline bool umin(T&m,S&&x){return x<m?m=x,1:0;}
template<class T,class S=T>inline bool umax(T&m,S&&x){return m<x?m=x,1:0;}
auto&operator<<(ostream&o,auto&&t)requires requires{tuple_cat(t);}{int f=0,u=&o!=&cerr;o<<"<"+u;apply([&](auto&...x){(((f++?o<<", "+u:o)<<x),...);},t);return o<<">"+u;}
auto&operator<<(ostream&o,ranges::range auto&&r)requires(!requires{string{r};}){int f=0,u=&o!=&cerr;o<<"["+u;for(auto&&x:r)(f++?o<<", "+u:o)<<x;return o<<"]"+u;}
#ifdef BIZON
	#define rr(v...) [](auto&&...x){ cerr << boolalpha << "\e[1;38;5;68m" << #v << " "; int _=0; ((cerr<<"\e[0;38;5;61m"<<",="[!_++]<<"\e[0m "<<x),...)<<endl; }(v);
#else
	#define rr(...) ;
	#define endl '\n'
#endif
#define bb(c) begin(c), end(c)
#define ff(T, name, args...) function<T(args)> name = [&](args)->T
#define ee(e) [&](auto&&it) { return e; }
#define jj(v...) v; [](auto&...x){(cin>>...>>x);}(v);
#define ii(v...) int jj(v)
using ll = decltype(1LL);


void run_case(const size_t ____case) { // rr(____case)
	
	
}

int main() {
	if(auto f="in.txt"; fopen(f,"r") && freopen(f,"r",stdin));
	cin.tie(0)->sync_with_stdio(0);
	
	size_t tn = 1; //cin>>tn;
	for(size_t t=1; t<=tn; ++t) run_case(t);
	
	return 0;
}
