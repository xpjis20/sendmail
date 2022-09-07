use utf8;
use Mail::Builder::Simple;
my $mail = Mail::Builder::Simple->new;
$mail->send(
            mail_client => {
                mailer => 'SMTP',
                mailer_args => {
                    host     => 'smtp.gmail.com',
                    username => 'MY.ID@gmail.com',
                    password => 'MY.PASSWORD',
                    ssl      => 1,
                },
            },
            # 아마 이 발신인 주소와 위의 username이 동일해야 gmail 쪽에서 허용해 줄 것이다
            from       => 'MY.ID@gmail.com',
            to         => 'RECIPEINT@gmail.com',

            # 제목은 디코드된 스트링이어야 한다. 위에 utf8 프라그마 유의
            subject    => '메일 보내기 테스트',
            # 이건 디코드된 스트링 또는 UTF-8인코드된 옥텟 둘 다 가능했음
            plaintext  => "안녕하십니까\n\n안녕히 계세요\n",
            # 첨부파일
            # attachment => './attach.zip',
        );
