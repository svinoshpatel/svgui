#ifndef FILEUTILS_H
#define FILEUTILS_H

#include <QObject>
#include <QString>

class FileUtils : public QObject
{
	Q_OBJECT
public:
	explicit FileUtils(QObject *parent = nullptr);

	Q_INVOKABLE QString getFileName(const QString &filePath);
};

#endif
