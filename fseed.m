function varargout = fseed(varargin)
% FSEED MATLAB code for fseed.fig
% FSEED, by itself, creates a new FSEED or raises the existing
% singleton*.
%
% H = FSEED returns the handle to a new FSEED or the handle to
% the existing singleton*.
%
% FSEED(��CALLBACK��,hObject,eventData,handles,��) calls the local
% function named CALLBACK in FSEED.M with the given input arguments.
%
% FSEED(��Property��,��Value��,��) creates a new FSEED or raises the
% existing singleton*. Starting from the left, property value pairs are
% applied to the GUI before fseed_OpeningFcn gets called. An
% unrecognized property name or invalid value makes property application
% stop. All inputs are passed to fseed_OpeningFcn via varargin.
%
% *See GUI Options on GUIDE��s Tools menu. Choose ��GUI allows only one
% instance to run (singleton)��.
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fseed

% Last Modified by GUIDE v2.5 10-Dec-2021 20:16:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename,'gui_Singleton', gui_Singleton,'gui_OpeningFcn', @fseed_OpeningFcn,'gui_OutputFcn', @fseed_OutputFcn,'gui_LayoutFcn', [] , 'gui_Callback', []);
if nargin && ischar(varargin{1})
gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
[varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% �� Executes just before fseed is made visible.
function fseed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
% varargin command line arguments to fseed (see VARARGIN)

% Choose default command line output for fseed
handles.output = hObject;
handles.img=[];
handles.imgdata=[];
handles.imgoutput=[];
guidata(hObject, handles);

% UIWAIT makes fseed wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% �� Outputs from this function are returned to the command line.
function varargout = fseed_OutputFcn(hObject, eventdata, handles)
% varargout cell array for returning output args (see VARARGOUT);
% hObject handle to figure
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% �� Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton1 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
[imgfilename imgpathname]=uigetfile({'*.jpg;*.png;*.jpeg'},'Select a RGB image');
if imgfilename
    imgdata=imread([imgpathname '\' imgfilename]);
    image(handles.axes1,imgdata);
    handles.imgfilename=imgfilename;
    handles.imgdata=imgdata;
end
I = handles.imgdata;
guidata(hObject,handles)
axes(handles.axes1); %��ͼ����ʾ��axes1��������
imshow(I);
handles.img=I; %���ֵ�ͼ��ΪI
guidata(hObject,handles); %����ϵͳ����axes1�ϵ�ͼ��

% �� Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton2 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I); %�Ҷ�ͼ
axes(handles.axes2);
imshow(G);
handles.img=G;
guidata(hObject,handles);

% �� Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton3 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I);
level = graythresh(G); %�����ֵ����ֵ
bw = im2bw(G,level); %ͼ���ֵ������
axes(handles.axes3);
imshow(bw);
handles.img=bw;
guidata(hObject,handles);

% �� Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton4 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I);
level = graythresh(G); %�����ֵ����ֵ
bw = im2bw(G,level); %ͼ���ֵ������
H = im2double(bw); %ת����˫����ͼ��ſ��Լ�������
J=imnoise(H, 'gaussian'); %��ͼ���м����˹����N(��=0����=0.1)
axes(handles.axes4);
imshow(J);
handles.img=J;
guidata(hObject,handles);

% �� Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton5 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)

% �� Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton6 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I);
level = graythresh(G); %�����ֵ����ֵ
bw = im2bw(G,level); %ͼ���ֵ������
H = im2double(bw); %ת����˫����ͼ��ſ��Լ�������
J=imnoise(H, 'gaussian'); %��ͼ���м����˹����N(��=0����=0.1)
K=medfilt2(J,[10,10]); %�Լ����ͼ�������ֵ�˲�
axes(handles.axes6);
imshow(K);
handles.img=K;
guidata(hObject,handles);

% �� Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton7 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I);
level = graythresh(G); %�����ֵ����ֵ
bw = im2bw(G,level); %ͼ���ֵ������
H = im2double(bw); %ת����˫����ͼ��ſ��Լ�������
J=imnoise(H, 'gaussian'); %��ͼ���м����˹����N(��=0����=0.1)
K=medfilt2(J,[10,10]); %�Լ����ͼ�������ֵ�˲�
I2 = imadjust(K); %�Աȶ���ǿ����
axes(handles.axes7);
imshow(I2);
handles.img=I2;
guidata(hObject,handles);

% �� Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject handle to pushbutton8 (see GCBO)
% eventdata reserved - to be defined in a future version of MATLAB
% handles structure with handles and user data (see GUIDATA)
I = handles.imgdata;
G=rgb2gray(I);
level = graythresh(G); %�����ֵ����ֵ
bw = imbinarize(G,level); %ͼ���ֵ������
H = im2double(bw); %ת����˫����ͼ��ſ��Լ�������
J=imnoise(H, 'gaussian'); %��ͼ���м����˹����N(��=0����=0.1)
K=medfilt2(J,[10,10]); %�Լ����ͼ�������ֵ�˲�
I2 = imadjust(K); %�Աȶ���ǿ����
background = imopen(I2,strel('disk',8)); %����ͼ�񣬲���ͼ����п�����
axes(handles.axes8);
imshow(background);
handles.img=background;
%guidata(hObject,handles);

[labeled,numObjects] = bwlabeln(background,4); % 4-connected����ǩ��ͳ��ͼ����������Ŀ,����һ����labeledһ�������С��backgroundһ��һ�������ֵͼ��������background����,4��ʾ������ص�λ���������������ڵ��ϡ��¡����ң�num���صľ���background����ͨ��ĸ���
disp('��ĿΪ��');
disp(numObjects) %��ʾͼ����������Ŀ
set(handles.edit1,'string',numObjects);
guidata(hObject,handles);
