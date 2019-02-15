function varargout = record(varargin)
% RECORD MATLAB code for record.fig
%      RECORD, by itself, creates a new RECORD or raises the existing
%      singleton*.
%
%      H = RECORD returns the handle to a new RECORD or the handle to
%      the existing singleton*.
%
%      RECORD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECORD.M with the given input arguments.
%
%      RECORD('Property','Value',...) creates a new RECORD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before record_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to record_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help record

% Last Modified by GUIDE v2.5 26-Jan-2019 07:49:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @record_OpeningFcn, ...
                   'gui_OutputFcn',  @record_OutputFcn, ...
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


% --- Executes just before record is made visible.
function record_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to record (see VARARGIN)

% Choose default command line output for record
handles.output = hObject;
c=imread('C:\eqari\1.jpg');
axes(handles.axes1);
imshow(c);

global spath;

global pssel;
global pasel;
impath = strcat('C:\eqari\',pssel,'-',pasel,'.png');
    tx=imread(impath);
    axes(handles.axes2);
    imshow(tx);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes record wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = record_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in rec.
function rec_Callback(hObject, eventdata, handles)
% hObject    handle to rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recobj;

% --- Executes on button press in stoprec.
function stoprec_Callback(hObject, eventdata, handles)
% hObject    handle to stoprec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stopobj;
training;
testing;
close(gcf);

result;
