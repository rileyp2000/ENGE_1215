% EngE 1215 Line Following Robots
%
% This program helps EngE 1215 students develop and formulate the conditional 
% statements for a fully autonomous Line Following Robot (will be in Robot_Stub.m).
% The program shows users the current sensor readings, stops the motors,
% and asks for the "power-level" for each motor for the next run until
% the motors are stopped again after another set of sensor readings is taken.
%
% This program assumes that a connection has been established to the
% arduino.  The variable 'a' must be established in the command window by
% calling the 'Robot_Connect' command.
%
% This version of the code is intended to be used with the new robots (as
% of fall 2019) with the red aluminum bodies.  This code will still run on
% the previous version of the robots (with the acrylic bodies and servo 
% motors), however negative power values sent to the motors will still
% result in a forward motion on the older robots.
%
% Last modified by Bono Shih on 22 October 2019 
% Adapted based on Rod La Foy's Sensor_Test.m and Motor_Test.m on 14 August 2019

%% Constants for reading sensors - do not change statements in this block 
% unless there is a change to the physical robot.  The numbers represent
% the pins each sensor is connected to.
SENSOR_PIN = 'D13';     % sensor control pin (all sensors)
LEFT_SENSOR_PIN = 'A4';  % pin to read left sensor values from
CENTER_SENSOR_PIN = 'A2';% pin to read center sensor values from
RIGHT_SENSOR_PIN = 'A0'; % pint to read right sensor values from

%% Changes and Additions
% pins have digital and analog designations, ex 13 => 'D13', 2 => 'A2'
% pinMode setup
a.pinMode(SENSOR_PIN,'DigitalOutput');
a.pinMode(LEFT_SENSOR_PIN,'AnalogInput');
a.pinMode(CENTER_SENSOR_PIN,'AnalogInput');
a.pinMode(RIGHT_SENSOR_PIN,'AnalogInput');


%% Constants for motor control - do not change statements in this block 
% unless there is a change to the physical robot. 
LEFT_MOTOR = 'D6';      % set pin 5 as the pin to control the left motor 
RIGHT_MOTOR = 'D5';     % set pin 6 as the pin to control the right motor 
lmMAX = 0.3;       % left motor maximum speed, range of acceptable values 0-1
rmMAX = 0.3;       % right motor maximum speed, range of acceptable values 0-1
OFF = 0;         % motor speed of 0, 0 is off

%% Variables for motor speed control - Change lmSpeed and rmSpeed based on testing your robot.
lmSpeed = 0.7*lmMAX;  % the current speed of left motor. Change this depending on sensor readings.
rmSpeed = 0.7*rmMAX;  % the current speed of right motor. Change this depending on sensor readings.

% These are the enabling pins for motor A, ie the right motor; one of these
% must be high and one must be low - switching which one is which will
% reverse the direction of the motors
AIN1 = 'D11';
AIN2 = 'D12';
% These are the enabling pins for motor B, ie the left motor; one of these
% must be high and one must be low - switching which one is which will
% reverse the direction of the motors
BIN1 = 'D9';
BIN2 = 'D8';

% This sets the enabling pins for motor A to digitial output
a.pinMode(AIN1,'DigitalOutput');
a.pinMode(AIN2,'DigitalOutput');
% This sets the enabling pins for motor B to digitial output
a.pinMode(BIN1,'DigitalOutput');
a.pinMode(BIN2,'DigitalOutput');

% This sets the enable pins for motor A (the right motor) so that the motor
% will go forward; switching the 1 and the 0 in this will switch the 
% direction to backwards; this is technically redundant, but is left in 
% here for illustrative purposes
a.digitalWrite(AIN1,1);
a.digitalWrite(AIN2,0);
% This sets the enable pins for motor B (the left motor) so that the motor 
% will go forward; switching the 1 and the 0 in this will switch the 
% direction to backwards; this is technically redundant, but is left in 
% here for illustrative purposes
a.digitalWrite(BIN1,1);
a.digitalWrite(BIN2,0);

%% This loop communicates with the motors, turning them on and off.  
% to keep your program clear and easy to understand

again = 1;  %Begin Loop

while again == 1

    %% Take the sensor readings and display to users
    a.digitalWrite(SENSOR_PIN,1) %output to turn sensors on
    left = a.analogRead(LEFT_SENSOR_PIN); %input value from each sensor one at a time.
    center = a.analogRead(CENTER_SENSOR_PIN);
    right = a.analogRead(RIGHT_SENSOR_PIN);
    a.digitalWrite(SENSOR_PIN,0) %output to turn off sensors
    sensor = [left,center,right]; %creates a vector of the sensor readings to make output easier to read
    disp(' ')
    disp('Sensor reading:')
    disp('Left Center Right')
    disp(sensor)


    a.analogWrite(LEFT_MOTOR,OFF) %output to left motor to turn it off.
    a.analogWrite(RIGHT_MOTOR,OFF) %output to right motor to turn it off.

    %% This section asks if user would like to proceed
    again = input('\nDo you want to enter motor speeds? 1 for Yes, 0 for No: ');

    if again == 1
        %% You will manually determine what lmSpeed should be like bases on
        %  the above sensor readings.  
        lmSpeed = input('Enter desired left motor speed level (-1.00 to +1.00): ');
        rmSpeed = input('Enter desired right motor speed level (-1.00 to +1.00): ');
            
        %% This entire section makes sure each motor moves in the right direction

        % Depending upon whether the left motor is set to run forwards or
        % backwards, the BIN pins polarities are switched to change the
        % direction of the motor
        if (lmSpeed<0)
            % This sets the left motor to run backwards
            a.digitalWrite(BIN1,0);
            a.digitalWrite(BIN2,1);
        elseif (lmSpeed>0)
            % This sets the left motor to run forwards
            a.digitalWrite(BIN1,1);
            a.digitalWrite(BIN2,0);
        end
        % If a negative value is input for the left motor, this inverts the
        % value
        if (lmSpeed<0)
            % This inverts the value of the left motor signal so that it is
            % positive when input into the Arduino
            lmSpeed=-1*lmSpeed;
        end
        
        % Depending upon whether the right motor is set to run forwards or
        % backwards, the AIN pins polarities are switched to change the
        % direction of the motor
        if (rmSpeed<0)
            % This sets the right motor to run backwards
            a.digitalWrite(AIN1,0);
            a.digitalWrite(AIN2,1);
        elseif (rmSpeed>0)
            % This sets the right motor to run forwards
            a.digitalWrite(AIN1,1);
            a.digitalWrite(AIN2,0);
        end
        % If a negative value is input for the right motor, this inverts the
        % value
        if (rmSpeed<0)
            % This inverts the value of the right motor signal so that it is
            % positive when input into the Arduino
            rmSpeed=-1*rmSpeed;
        end

        %% This section actuates both the motors
        a.analogWrite(LEFT_MOTOR,lmSpeed) %output to left motor
        a.analogWrite(RIGHT_MOTOR,rmSpeed) %output to the right motor
    end
end
