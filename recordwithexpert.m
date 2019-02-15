function varargout = recordwithexpert(varargin)
% RECORDWITHEXPERT M-file for recordwithexpert.fig
%      RECORDWITHEXPERT, by itself, creates a new RECORDWITHEXPERT or raises the existing
%      singleton*.
%
%      H = RECORDWITHEXPERT returns the handle to a new RECORDWITHEXPERT or the handle to
%      the existing singleton*.
%
%      RECORDWITHEXPERT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECORDWITHEXPERT.M with the given input arguments.
%
%      RECORDWITHEXPERT('Property','Value',...) creates a new RECORDWITHEXPERT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recordwithexpert_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recordwithexpert_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recordwithexpert

% Last Modified by GUIDE v2.5 30-May-2011 16:19:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recordwithexpert_OpeningFcn, ...
                   'gui_OutputFcn',  @recordwithexpert_OutputFcn, ...
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


% --- Executes just before recordwithexpert is made visible.
function recordwithexpert_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recordwithexpert (see VARARGIN)

% Choose default command line output for recordwithexpert
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recordwithexpert wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recordwithexpert_OutputFcn(hObject, eventdata, handles) 
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
recobjlive;


% --- Executes on button press in stoprec.
function stoprec_Callback(hObject, eventdata, handles)
% hObject    handle to stoprec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global count;
stopobjlive;
count= count +1;
if (count < 2)
    close (gcf);
    recordwithexpert;
end
if (count == 2)
    training;
    testing;
     close(gcf);
     
    result;
    
   
end



% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global count;
if (count == 0 )
set(hObject,'string','The expert is to record the Voice');   
end 
 if (count == 1)
 set(hObject,'string','The Learner is to record the Voice');
end
