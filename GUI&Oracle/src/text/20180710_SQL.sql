


-- CHAR(n)
CREATE TABLE type_test_04 (
    data1 CHAR,
    data2 CHAR(10),
    data3 CHAR(10 CHAR)
--    , data4 VARCHAR2 --VARCHAR2는 반드시 크기지정해야함
);

INSERT INTO type_test_04
VALUES ( '1', '1234567890', '1234567890' );

INSERT INTO type_test_04(data2, data3)
VALUES ( '가나다', '일이삼사오육칠팔구십' );

INSERT INTO type_test_04(data2, data3)
VALUES ( '12345', '12345' );

SELECT TRIM(data1), TRIM(data2), TRIM(data3) FROM type_test_04;



CREATE TABLE type_test_05 (
    data DATE
);
SELECT TO_CHAR(data, 'syyyy/mm/dd hh24:mi:ss') FROM type_test_05;
INSERT INTO type_test_05 VALUES ( sysdate );
INSERT INTO type_test_05 VALUES ( '2020/11/21' );

INSERT INTO type_test_05
VALUES ( to_date('-2012/11/24', 'syyyy/mm/dd') );



-- 년도 YY, RR
SELECT to_char(data, 'yyyy/mm/dd'),
    to_char(data, 'rrrr/mm/dd')
FROM type_test_05;

INSERT INTO type_test_05
VALUES ( to_date('10/7/3', 'rr/mm/dd') );
INSERT INTO type_test_05
VALUES ( to_date('80/8/5', 'rr/mm/dd') );

INSERT INTO type_test_05
VALUES ( to_date('10/7/3', 'yy/mm/dd') );
INSERT INTO type_test_05
VALUES ( to_date('80/8/5', 'yy/mm/dd') );


SELECT * FROM type_test_05;
SELECT TO_CHAR(data, 'yyyy/mm/dd') FROM type_test_05;


CREATE TABLE type_test_06 (
    data TIMESTAMP
);
INSERT INTO type_test_06
VALUES ( systimestamp );
SELECT * FROM type_test_06;



-- LONG
CREATE TABLE type_test_07 (
    data LONG
--    , data2 LONG -- LONG은 테이블 당 한개만 가능
);
INSERT INTO type_test_07 VALUES ( '안녕하세요' );
SELECT * FROm type_test_07;


INSERT INTO type_test_07
VALUES ( 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed mi neque. Pellentesque commodo magna tortor, id efficitur nulla venenatis sed. Donec dictum risus nec ornare molestie. Nullam scelerisque nibh ut dui accumsan eleifend vel vitae neque. Suspendisse aliquam tempus enim, ut dignissim lorem consectetur vitae. Aenean posuere rhoncus eros et sodales. Proin fermentum dapibus placerat. Morbi blandit fringilla vestibulum. Morbi id pretium purus. Morbi aliquet mi rhoncus purus luctus commodo.

Donec non dictum ipsum. Sed id consequat lacus, eu commodo libero. Donec sapien diam, faucibus eget interdum vel, bibendum vitae orci. In aliquam urna risus, feugiat sodales erat condimentum ullamcorper. Nullam eleifend massa sit amet tempus aliquam. Morbi sed ante vel ex hendrerit luctus vel quis enim. Duis dictum libero et cursus lobortis. Nullam mattis mollis ipsum, convallis tempus dui fringilla tristique. Maecenas sed tortor lobortis, mattis tortor eu, finibus neque.

Suspendisse malesuada imperdiet luctus. Aliquam egestas, magna sit amet viverra consectetur, dolor mauris dapibus dui, sit amet fringilla urna magna vitae purus. Vivamus diam tellus, finibus vulputate tortor non, dapibus viverra velit. Pellentesque consectetur nunc at iaculis auctor. Nulla posuere massa at leo viverra, sed tempor metus egestas. Proin ultricies, metus ut rhoncus iaculis, ex justo rhoncus neque, ut facilisis eros leo ac massa. Pellentesque a mattis quam. Mauris imperdiet mauris vitae tincidunt malesuada. Mauris eleifend rutrum tortor vel blandit. Sed egestas eu purus vel rutrum.

Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer non magna in orci fringilla blandit sit amet a ligula. Aliquam sem nibh, pharetra id imperdiet a, euismod sit amet sem. Duis facilisis nulla ut lobortis auctor. Curabitur nec fringilla nunc. Nullam ac felis ligula. Curabitur finibus id orci ut elementum. Quisque vel eleifend lectus. In feugiat ut erat vel tempor. Etiam imperdiet dolor vel quam sagittis eleifend. Aenean ex nisl, venenatis ultricies tincidunt vestibulum, efficitur nec elit.

Nam fringilla, urna quis condimentum hendrerit, leo dui volutpat dolor, et congue metus augue sit amet turpis. Sed posuere arcu non purus varius, sit amet posuere eros consectetur. Nunc blandit lorem quis sapien accumsan cursus. Pellentesque pulvinar eget ante sed dictum. Etiam euismod sollicitudin diam eget tincidunt. Suspendisse potenti. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

' );

INSERT INTO type_test_07
VALUES ( '끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.');


INSERT INTO type_test_07
VALUES ( '끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.');



-- CLOB
CREATE TABLE type_test_08 (
    data CLOB
);
INSERT INTO type_test_08
VALUES('끓는 용기가 남는 되는 기관과 곳이 그것은 구하지 같은 황금시대다. 그러므로 인생에 우리 사막이다. 가슴이 열락의 기쁘며, 있을 커다란 기관과 노년에게서 방황하여도, 바이며, 있다. 설레는 두손을 아름답고 사라지지 위하여 생생하며, 방지하는 이상의 것이 있으랴? 주는 안고, 같은 천지는 구하지 위하여서, 같이, 생생하며, 것이다. 되는 두손을 가치를 청춘의 사막이다. 수 청춘에서만 청춘의 우리 인생에 이상의 너의 뿐이다. 같으며, 부패를 청춘의 같은 철환하였는가? 얼음이 주며, 노년에게서 우리의 것은 구하기 자신과 못할 동력은 때문이다. 아니한 새 밥을 그들은 미묘한 피어나는 인간은 튼튼하며, 말이다. 쓸쓸한 소금이라 것이다.보라, 기관과 타오르고 원대하고, 얼음이 교향악이다.

길지 크고 예가 열락의 그들은 사막이다. 구하지 피가 찬미를 살 밥을 용감하고 소금이라 칼이다. 든 물방아 내려온 산야에 운다. 얼마나 이상의 거친 뿐이다. 힘차게 옷을 풀이 뭇 방황하여도, 끓는다. 수 내려온 속에 남는 이성은 가지에 미인을 그들은 약동하다. 간에 가지에 희망의 되려니와, 인간의 인생에 능히 교향악이다. 피는 길지 만물은 청춘을 아름다우냐? 쓸쓸한 주며, 현저하게 아름답고 그들에게 청춘이 바로 목숨이 약동하다.

그들에게 이상 방지하는 있으며, 만천하의 안고, 불러 그들은 시들어 피다. 있는 청춘을 싶이 얼음이 위하여, 보라. 남는 피부가 생의 같지 대중을 과실이 길지 눈에 그리하였는가? 실현에 들어 타오르고 어디 속에 풍부하게 든 따뜻한 얼음에 사막이다. 듣기만 우리는 따뜻한 물방아 없으면 얼마나 황금시대다. 있는 낙원을 꽃이 영락과 대한 바이며, 간에 광야에서 지혜는 아니다. 스며들어 있을 생명을 피가 못할 것이다. 대한 설산에서 뛰노는 인생에 이것이다. 실현에 군영과 그들의 위하여서, 있으랴? 것은 든 뼈 노년에게서 못할 봄바람이다.

평화스러운 청춘 간에 스며들어 목숨을 구할 있는 앞이 그리하였는가? 청춘 있는 그들은 끝에 시들어 있으랴? 구하기 이상의 뜨고, 꽃이 이것을 무엇이 무엇을 길지 보라. 인생의 착목한는 불어 평화스러운 있는 황금시대를 교향악이다. 있을 되는 앞이 현저하게 고동을 있는가? 그와 청춘의 갑 피는 부패를 사랑의 것이다. 예수는 아름답고 불어 그리하였는가? 영락과 수 아니한 있는 만물은 약동하다. 시들어 가는 피가 그들은 그들의 그것을 있을 황금시대다. 인생을 이성은 없으면 봄날의 얼마나 무한한 두기 것은 보라. 거선의 청춘에서만 꽃이 청춘을 되려니와, 끝까지 피고 봄바람이다.

품에 불러 남는 찾아다녀도, 대한 것이다. 끓는 얼음에 없으면 품었기 같은 주는 이상의 이상 쓸쓸하랴? 미인을 이상은 위하여 풀이 노래하며 쓸쓸하랴? 되려니와, 뛰노는 크고 청춘이 살았으며, 이 이것이야말로 밥을 아름다우냐? 대한 끝에 것은 풍부하게 끓는 수 꽃 같으며, 봄바람이다. 부패를 뜨고, 아니한 웅대한 부패뿐이다. 미묘한 귀는 없는 것이다. 그들은 피가 산야에 눈이 아니한 용기가 웅대한 그와 봄바람이다. 낙원을 사랑의 많이 날카로우나 청춘이 아름다우냐? 어디 끓는 가슴이 못할 따뜻한 청춘은 하여도 부패뿐이다. 못할 사랑의 소리다.이것은 따뜻한 몸이 황금시대다.');

SELECT * FROM type_test_08;

-- LOB 일부 조회하기
SELECT DBMS_LOB.SUBSTR(data, 10, 2) FROM type_test_08;

-- LOB 전체 조회하기
SELECT DBMS_LOB.SUBSTR(data, length(data), 1)
FROM type_test_08;









-- 제약조건, 제약사항

-- 사용자의 모든 제약사항 (자료사전)
SELECT * FROM USER_CONSTRAINTS;

-- 컬럼에 해당하는 제약사항 (자료사전)
SELECT * FROM USER_CONS_COLUMNS;


SELECT
	SUBSTR(A.COLUMN_NAME,1,15) COLUMN_NAME,
	DECODE(B.CONSTRAINT_TYPE,
		'P','PRIMARY KEY',
		'U','UNIQUE KEY',
		'C','CHECK OR NOT NULL',
		'R','FOREIGN KEY'
	) CONSTRAINT_TYPE,
	A.CONSTRAINT_NAME,
    SEARCH_CONDITION
FROM USER_CONS_COLUMNS A, USER_CONSTRAINTS B
WHERE A.TABLE_NAME = UPPER('&table_name')
	AND A.TABLE_NAME = B.TABLE_NAME
	AND A.CONSTRAINT_NAME = B.CONSTRAINT_NAME
ORDER BY 1;



-- NOT NULL
CREATE TABLE cons_01 (
    data VARCHAR2(10) NOT NULL
);
desc cons_01;
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_02');

CREATE TABLE cons_02 (
    data VARCHAR2(10) CONSTRAINT cons_02_nn NOT NULL
);

CREATE TABLE cons_03 (
    data VARCHAR2(10)
);

-- 만들어져있는 테이블에 제약조건 반영 (이름 필수)
ALTER TABLE cons_03
ADD CONSTRAINT cons_03_uq UNIQUE ( data );

INSERT INTO cons_03 VALUES( '111' );


-- NOT NULL 제약조건 반영하기
ALTER TABLE cons_03
MODIFY data NOT NULL;

desc cons_03;




-- CHECK
CREATE TABLE cons_04 (
    data NUMBER CHECK( data>=1 AND data<=100 )
);
INSERT INTO cons_04 VALUES ( 10 );
INSERT INTO cons_04 VALUES ( 333 );
INSERT INTO cons_04 VALUES ( 100 );



-- cons_05 테이블 생성 ( 컬럼 : data NUMBER )

-- ALTER TABLE을 이용한 data 의
-- 제약사항 CHECK 추가
-- 1000, 2000, 3000, 4000

CREATE TABLE cons_05 (
    data1 NUMBER,
    data2 NUMBER );

ALTER TABLE cons_05
ADD CONSTRAINT cons_05_ck
CHECK( data1 IN (1000,2000,3000,4000) );

ALTER TABLE cons_05
MODIFY data2 CHECK( data2 IN (1000,2000,3000,4000) );



-- DEFAULT
CREATE TABLE cons_06 (
    data1 NUMBER DEFAULT 10,
    data2 DATE,
    data3 VARCHAR2(10) 
);
desc cons_06;

-- 제약조건 자료사전
SELECT * FROM USER_CONSTRAINTS
WHERE table_name = UPPER('cons_06');

-- 테이블 컬럼 정보 자료사전
SELECT * FROM USER_TAB_COLUMNS
WHERE table_name = UPPER('cons_06');

-- 테이블의 제약조건 추가
--ALTER TABLE cons_06
--ADD CONSTRAINT 


-- 테이블의 컬럼 변경
ALTER TABLE cons_06
MODIFY ( data2 DEFAULT sysdate );

ALTER TABLE cons_06
MODIFY ( data3 DEFAULT 'HI' NOT NULL );

-- 명시적으로 null 을 INSERT할 때에는 DEFAULT 동작 안함
INSERT INTO cons_06
VALUES ( null, null, 'AA' );
SELECT * FROM cons_06;

INSERT INTO cons_06 ( data3 )
VALUES ( 'BB' );

INSERT INTO cons_06 ( data1 )
VALUES ( 5 );

INSERT INTO cons_06 ( data1, data2, data3 )
VALUES ( 5, sysdate, 'HI' );

INSERT INTO cons_06; -- 안됨
INSERT INTO cons_06 VALUES (); -- 안됨



-- PRIMARY KEY
CREATE TABLE cons_07(
    no NUMBER CONSTRAINT cons_07_pk PRIMARY KEY,
    data VARCHAR2(20) NOT NULL
);

CREATE TABLE cons_08 (
    no NUMBER PRIMARY KEY );
    
CREATE TABLE cons_09 (
    idx NUMBER,
    id VARCHAR2(20),
    
    CONSTRAINT cons_09_pk PRIMARY KEY ( idx )
);


CREATE TABLE cons_10 (
    idx NUMBER,
    data VARCHAR2(20)
);
-- 제약조건 추가 - PK추가
ALTER TABLE cons_10
ADD CONSTRAINT cons_10_pk PRIMARY KEY ( idx );

-- 제약조건 삭제 - PK삭제
ALTER TABLE cons_10
DROP CONSTRAINT cons_10_pk;


-- 제약조건 비활성화 - PK 잠깐 끄기
ALTER TABLE cons_10
DISABLE CONSTRAINT cons_10_pk;

-- 제약조건 활성화 - 비활성화된 PK 활성화하기
ALTER TABLE cons_10
ENABLE CONSTRAINT cons_10_pk;



-- FOREIGN KEY
desc cons_10;

CREATE TABLE cons_11 (
    num NUMBER,
    data VARCHAR2(20),
    CONSTRAINT cons_11_fk
        FOREIGN KEY ( num )
        REFERENCES cons_10 ( idx )
);

CREATE TABLE cons_12 (
    num NUMBER,
    data VARCHAR2(30)
);
ALTER TABLE cons_12
ADD CONSTRAINT cons_12_fk
    FOREIGN KEY ( num )
    REFERENCES cons_10 ( idx );