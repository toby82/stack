from smtplib import SMTP
def prompt(prompt):
    return raw_input(prompt).strip()
f_addr = prompt("From: ")
t_addr = prompt("To: ")
s_user = prompt("User: ")
s_pass = prompt("Passwd: ")
s_host = 'smtp.163.com'
sub = prompt("Sub: ")
content = ''' hi,this is python smtplib test'''
msg = "From: f_addr\r\n"+"To: t_addr\r\n"+"Subject: sub\r\n\r\n"+content
ser = SMTP()
ser.set_debuglevel(1)
ser.connect(s_host, 25)
ser.login(s_user,s_pass)
ser.sendmail(f_addr, t_addr, msg)
ser.quit()
ser.close()
