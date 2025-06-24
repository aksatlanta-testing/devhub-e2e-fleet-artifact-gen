
{{- define "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.fullname" -}}
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


{{- define "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.labels" -}}
helm.sh/chart: {{ include "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.chart" . }}
{{ include "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6be26223-7958-4c05-9da1-9c145b363cbf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}