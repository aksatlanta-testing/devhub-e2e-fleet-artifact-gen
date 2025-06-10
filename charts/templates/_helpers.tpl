
{{- define "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.fullname" -}}
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


{{- define "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.labels" -}}
helm.sh/chart: {{ include "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.chart" . }}
{{ include "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1eacd42a-dd13-41ba-9351-37e8d971b504.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}