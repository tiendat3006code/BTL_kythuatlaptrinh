#include "controller.h"

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
    }
}

void Controller::serialRead()
{
    if(port->isOpen()){
        qInfo()<<"PORT IS OPEN";
        connect(port, &QSerialPort::readyRead, this, &Controller::handleData);
    }
}

void Controller::handleData()
{
    RxBuffer = port->readAll();
    port->flush();
    port->waitForReadyRead(10);
    qInfo()<<RxBuffer;
    RxBuffer.clear();
    port->clear();
}
