
{{- define "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.fullname" -}}
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


{{- define "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.labels" -}}
helm.sh/chart: {{ include "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.chart" . }}
{{ include "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo559d618c-2cd8-4b38-9192-2405ee0e43cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}