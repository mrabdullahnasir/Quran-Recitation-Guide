function varargout = selection(varargin)
% SELECTION MATLAB code for selection.fig
%      SELECTION, by itself, creates a new SELECTION or raises the existing
%      singleton*.
%
%      H = SELECTION returns the handle to a new SELECTION or the handle to
%      the existing singleton*.
%
%      SELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECTION.M with the given input arguments.
%
%      SELECTION('Property','Value',...) creates a new SELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before selection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to selection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help selection

% Last Modified by GUIDE v2.5 26-Jan-2019 07:31:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @selection_OpeningFcn, ...
                   'gui_OutputFcn',  @selection_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before selection is made visible.
function selection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to selection (see VARARGIN)

% Choose default command line output for selection
handles.output = hObject;
c=imread('C:\eqari\1.jpg');
imshow(c);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes selection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = selection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in aselect.
function aselect_Callback(hObject, eventdata, handles)
% hObject    handle to aselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns aselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from aselect
val = get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function aselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sselect.
function sselect_Callback(hObject, eventdata, handles)
% hObject    handle to sselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sselect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sselect
val2 = get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function sselect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sselect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in proceed.
function proceed_Callback(hObject, eventdata, handles)
% hObject    handle to proceed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ssel = (num2str(get(handles.sselect,'Value')));
asel = (num2str(get(handles.aselect,'Value')));
global spath;
global pssel;
global pasel;
pssel=ssel;
pasel=asel;


spath = strcat('C:\eqari\',ssel,'-',asel,'.wav');


%writing info to a file for later access----- Alternate way if it goes bad
pname = fopen('C:\eqari\temppath.txt', 'w');
fwrite(pname,spath);
fclose(pname);


guidata(hObject,handles)
close(gcf);
record;


% --- Executes on button press in listen.
function listen_Callback(hObject, eventdata, handles)
% hObject    handle to listen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global spath;
global z;
ssel = (num2str(get(handles.sselect,'Value')));
asel = (num2str(get(handles.aselect,'Value')));
spath = strcat('C:\eqari\',ssel,'-',asel,'.wav');
disp(spath)
[y, Fs] = audioread(spath);
z=audioplayer(y,Fs);
play(z);
