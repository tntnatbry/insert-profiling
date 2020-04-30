#!/bin/bash

num_cols=29

c1=(true false)
c2=(-120 -110 -105 -50 -40 -30 -20 0 1 3 6 8 100 120)
c3=(-32766 -19000 -17000 -10000 -5000 -1000 -500 0 1 100 1000 10000 32000)
c4=(-2147483646 -214748364 -21474836 -2147483 -214748 -21474 2147 214748 2147489 21474836 214748364 2147483640)
c5=(-9223372036854775805 -9223372036854775802 -922337203685477580 -9223372036854775 -922337203685 -92233720 922337203 9223372036 922337203685 92233720368547 922337203685477580)
c6=(-9 -6 -4 -2 0 1 3 5 7)
c7=(-1234 -2134 -9999 0 1234 2345 9999 1000)
c8=(-12345 -99999 -23456 -45678 0 123 1234 12345 99999)
c9=(-1.23 -9.99 -23.34 -123.23 0.12 1.23 9.99 99.09 1234.49)
c10=(123454 99999 123203 84723 -847 -394872 -28347 328947)
c11=(348902840328 329482903840 999999999999999999 34729223904 29348290439248 -32847293 -23984732974 -238974293732 -42983748923784)
c12=(1.123 23.23 31.1212 120.123 4546.34 -90.12 -12.12)
c13=(1.123 23.23 31.1212 120.123 4546.34 -90.12 -12.12)
c14=('"1970-01-01"' '"1990-10-28"' '"1985-03-03"' '"2000-10-10"' '"2010-02-01"' '"2020-03-04"')
c15=('"1970-01-01 02:03:06"' '"1990-10-28 06:02:01"' '"1985-03-03 10:01:08"' '"2000-10-10 11:02:12"' '"2010-02-01 12:10:11"' '"2020-03-04 02:01:01"')
c16=('"a"' '"b"' '"c"' '"d"' '"e"' '"f"' '"g"' '"h"' '"i"' '"j"')
c17=('"fa"' '"sb"' '"gc"' '"jd"' '"je"' '"rf"' '"wg"' '"jh"' '"ui"' '"nj"')
c18=('"sffa"' '"sfgb"' '"hggc"' '"jdgd"' '"sgje"' '"jtyrf"' '"jtwg"' '"ryjh"' '"ryui"' '"hhnj"')
c19=('"saffa"' '"sfgcb"' '"fhggc"' '"jdgrd"' '"shgje"' '"ejtyrf"' '"hjtwg"' '"rjyjh"' '"rryui"' '"ehhnj"')
c20=('"sdsaffa"' '"sdsfgcb"' '"fhggsdc"' '"jdsdgrd"' '"shsdgje"' '"esdjtyrf"' '"hsdjtwg"' '"rsdjyjh"' '"rsdryui"' '"esdhhnj"')
c21=('"sdfsfdsfgsf"' '"gjglkjskglsj"' '"gjlkjsgljsjdg"' '"sjglkjrlgjlw"' '"wuoiwufjwfjwfekjl"' '"fjglkjslkgjdsljgljs"')
c22=('"fkasljklsajflkjsalkjflksajflkjasfd"' '"wiujfwjfglkajmngfksjgfwalkjglsaglsa"' '"arjglkjaglkalkgjwgjlkewrgjlwk"')
c23=('"a"' '"b"' '"c"' '"d"' '"e"' '"f"' '"g"' '"h"' '"i"' '"j"')
c24=('"fa"' '"sb"' '"gc"' '"jd"' '"je"' '"rf"' '"wg"' '"jh"' '"ui"' '"nj"')
c25=('"sffa"' '"sfgb"' '"hggc"' '"jdgd"' '"sgje"' '"jtyrf"' '"jtwg"' '"ryjh"' '"ryui"' '"hhnj"')
c26=('"saffa"' '"sfgcb"' '"fhggc"' '"jdgrd"' '"shgje"' '"ejtyrf"' '"hjtwg"' '"rjyjh"' '"rryui"' '"ehhnj"')
c27=('"sdfsfdsfgsf"' '"gjglkjskglsj"' '"gjlkjsgljsjdg"' '"sjglkjrlgjlw"' '"wuoiwufjwfjwfekjl"' '"fjglkjslkgjdsljgljs"')
c28=('"fkasljklsajflkjsalkjflksajflkjasfd"' '"wiujfwjfglkajmngfksjgfwalkjglsaglsa"' '"arjglkjaglkalkgjwgjlkewrgjlwk"')
c29=('"ksajflkjlksajflkjsalfkjslakjfwkljfwekljfwlkjgfwlgjlkrjglksjgpwojkgpagjwg"' '"jwijfglkjgflkewrjgl4kjglkrjlkjkljaklsjaklasdjglkasgjlkas"' '"jlkgjalkgjnvlkanlkvnmlkawgjklajgpwerjgpwesklgjflskjglw"')

get_random_index() {
  lower_limit=0
  upper_limit=$1
  upper_limit=$(($upper_limit-1))
  range=$(($upper_limit-$lower_limit+1))
  local result=$RANDOM
  let "result %= $range"
  echo $result
}

echo "INSERT INTO INSERT_PROFILE VALUES"
for j in {1..100000}
  do
    if [ $j -ne 1 ]; then
      echo ","
    fi
    # constuct a record from all the columns
    record="("
    for i in {1..29}
      do
         if [ $i -ne 1 ]; then
           record+=","
         fi
	 if [ $i -eq 15 ]; then
           len=${#c15[@]}
           idx=$(get_random_index $len)
           record+="${c15[$idx]}"
	 else           
           arr=c$i[@]
           tmparr=(${!arr})
           len=${#tmparr[@]}
           idx=$(get_random_index $len)
           record+="${tmparr[$idx]}"
	 fi
    done
    record+=")"
    echo -n $record
done
echo -n ";"
