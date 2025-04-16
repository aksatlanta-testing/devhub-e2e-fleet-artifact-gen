
{{- define "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.fullname" -}}
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


{{- define "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.labels" -}}
helm.sh/chart: {{ include "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.chart" . }}
{{ include "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a2b2179-037a-47bb-aab4-c667311e3cef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}