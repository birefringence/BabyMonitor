/*
  Baby Monitor for SailfishOS
  Copyright (C) 2015  Thomas Zell <t.zell@gmx.de>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

#include <QAudioInput>
#include <QDebug>

#include "soundanalyzer.h"

SoundAnalyzer::SoundAnalyzer(QObject *parent) :
    QObject(parent)
{
    QAudioFormat af;

    af.setSampleRate(8000);
    af.setChannelCount(1);
    af.setSampleSize(8);
    af.setCodec("audio/pcm");
    af.setByteOrder(QAudioFormat::LittleEndian);
    af.setSampleType(QAudioFormat::UnSignedInt);

    QAudioDeviceInfo info(QAudioDeviceInfo::defaultInputDevice());

//    qDebug() << "Device: " << info.deviceName();

//    af = info.nearestFormat(af);
//    qDebug() << "Sample Rate   " << af.sampleRate();
//    qDebug() << "Channel Count " << af.channelCount();
//    qDebug() << "Sample Size   " << af.sampleSize();
//    qDebug() << "Codec         " << af.codec();
//    qDebug() << "Byte Order    " << af.byteOrder();
//    qDebug() << "Sample Type   " << af.sampleType();

    audio.reset(new QAudioInput(info, af, this));

    io = audio->start();
//    audio->setNotifyInterval(500);
//    connect(audio.data(), SIGNAL(notify()), this, SLOT(analyze()));
    connect(io, SIGNAL(readyRead()), this, SLOT(analyze()));
//    qDebug() << "result: " << audio->error();
}

//void SoundAnalyzer::testsignal()
//{
////    qDebug() << "Input";
////    QList<QAudioDeviceInfo> list = QAudioDeviceInfo::availableDevices(QAudio::AudioInput);

////    for (int i = 0; i < list.size(); ++i) {
////        qDebug() << list[i].deviceName();
////    }
////    qDebug() << "Output";
////    list = QAudioDeviceInfo::availableDevices(QAudio::AudioOutput);

////    for (int i = 0; i < list.size(); ++i) {
////        qDebug() << list[i].deviceName();
////    }
//    qDebug() << "State " << audio->state();
//}

void SoundAnalyzer::analyze()
{
    if (io) {
        int i = audio->bytesReady();
        if (i > 0) {
            QByteArray buffer = io->read(i);
            int sum = 0;
            for (int j = 0; j < buffer.size(); j++) {
                sum += abs(buffer[j] - 127);
            }
//            qDebug() << "Sum:" << sum / i;
            emit soundLevel(sum/i, i/8);
        }
    }
}

SoundAnalyzer::~SoundAnalyzer()
{
    audio->stop();
}
