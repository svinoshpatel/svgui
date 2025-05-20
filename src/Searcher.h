#ifndef SEARCHER_H
#define SEARCHER_H

#include <QObject>
#include <QString>
#include <QVector>

class Searcher : public QObject
{
	Q_OBJECT
public:
	explicit Searcher(QObject *parent = nullptr);

	Q_INVOKABLE QVector<int> search(const QString &text, const QString &pattern);
};

#endif
