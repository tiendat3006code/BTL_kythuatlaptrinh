#include "controller.h"
#include "config.h"

Controller::Controller(QObject *parent)
    : QObject{parent}
{

}

void Controller::serialInit()
{
    port->setPortName(port_name + QString::number(port_count));
    port->setBaudRate(QSerialPort::Baud115200);
    port->setParity(QSerialPort::NoParity);
    port->setDataBits(QSerialPort::Data8);
    port->setFlowControl(QSerialPort::NoFlowControl);
    port->setStopBits(QSerialPort::OneStop);

    if(!port->open(QIODevice::ReadWrite)){
        qInfo()<<port->errorString();
        port_count ++;
        serialInit();
    }
    else{
        qInfo()<<"OPEN PORT SUCCESS";
        setPower(0);
    }
}

void Controller::serialRead()
{
    if(port->isOpen()){
        qInfo()<<"PORT IS OPEN";
        connect(port, &QSerialPort::readyRead, this, &Controller::handleData);
    }
}

void Controller::controlCar(int status)
{
    switch (status) {
    case FORWARD:{
        qInfo()<<"car move forward";
        sendDataControl('f');
        break;
    }
    case BACKWARD:{
        qInfo()<<"car move backward";
        sendDataControl('b');
        break;
    }
    case STOP:{
        sendDataControl('s');
        qInfo()<<"car stop";
        break;
    }
    case RIGHT:{
        qInfo()<<"car move right";
        sendDataControl('r');
        break;
    }
    case LEFT:{
        qInfo()<<"car move left";
        sendDataControl('l');
        break;
    }
    default:
        break;
    }
}

void Controller::setPower(int power)
{
    QByteArray dataToSend;
    dataToSend.append(POWER);
    dataToSend.append(power);

    port->write(dataToSend);
    port->flush();
    port->clear();
    // port->waitForBytesWritten(5);
    qInfo()<<"Set power";
}

int Controller::getSensorResult()
{
    return sensorResult;
}

void Controller::handleData()
{
    RxBuffer.append(port->readAll());
    if(RxBuffer.at(RxBuffer.length() - 1) == 0x0A){
        QString str = RxBuffer.mid(0, RxBuffer.length() - 2);
        sensorResult = str.toInt();
        // qInfo()<<sensorResult;
        RxBuffer.clear();
        port->clear();
    }

}

void Controller::sendDataControl(QChar c)
{
    QByteArray arrayToSend;
    arrayToSend.append(CONTROL);
    arrayToSend.append(c.toLatin1());
    port->write(arrayToSend);
    port->flush();
    // port->waitForBytesWritten(5);
    port->clear();
}
