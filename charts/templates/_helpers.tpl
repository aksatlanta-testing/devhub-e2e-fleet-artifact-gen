
{{- define "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.labels" -}}
helm.sh/chart: {{ include "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.chart" . }}
{{ include "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocdd56d8d-8600-4983-a053-8cab71b2a9be.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}