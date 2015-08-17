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

#ifndef SOUNDANALYZER_H
#define SOUNDANALYZER_H

#include <QObject>
#include <QAudioInput>

class SoundAnalyzer : public QObject
{
    Q_OBJECT
public:
    explicit SoundAnalyzer(QObject *parent = 0);
    virtual ~SoundAnalyzer();


signals:
    void soundLevel(int level, int millis);

public slots:
    void analyze();
//    void testsignal();

private:
//    QAudioInput *audio;
    QScopedPointer< QAudioInput > audio;
    QIODevice *io;
};

#endif // SOUNDANALYZER_H
