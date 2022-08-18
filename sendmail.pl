#!/usr/bin/perl

use warnings;
use strict;
use Net::SMTP;

my $smtpserver = 'smtp.kiom.re.kr';#smtp 서버 정보
my $smtpport = 25;#smtp 포트
#my $smtpuser   = 'soso@kiom.re.kr';//
my $smtpuser   = 'hpadmin@kiom.re.kr';
my $smtppassword = 'soso/kiom112233!';

my $smtp = Net::SMTP->new($smtpserver, Port=>$smtpport, Timeout => 100, Debug => 1);
#my $smtp = Net::SMTP->new($smtpserver, Port=>$smtpport, Timeout => 100, Debug => 1);
die "Could not connect to server!\n" unless $smtp;

#$smtp->auth($smtpuser, $smtppassword);#smtp 서버가 인증이 필요한 경우 기입
$smtp->mail($smtpuser);
$smtp->to('xpjis20@imgtech.co.kr');
$smtp->data();#여기부터 헤더가 끝나고 데이터라는 의미
$smtp->datasend("From: hpadmin\@kiom.re.kr\n");
$smtp->datasend("To: xpjis20\@imgtech.co.kr\n");
$smtp->datasend("Subject: mailTestMessage\n");#제목
$smtp->datasend("testMessage\n");#본문
$smtp->dataend();## 실제로는 . 메시지가 날아간다. 메일 끝이라는 의미.
$smtp->quit;
