unit Unit_Tool;

interface//��������
uses Unit_Attribution; //��Ԫ�ڲ�������������Ԫ
var Name:string;//�����ⲿʹ��
implementation//ʵ������
var Age:Integer;//ֻ���ڱ���Ԫʹ��

initialization//��ʼ������ֻ�ɵ���
Name:='aaa';
Age:=18;
finalization//��������ֻ�ɵ���
Name:='';
Age:=0;
end.
