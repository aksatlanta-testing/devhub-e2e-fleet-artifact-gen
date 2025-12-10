
{{- define "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.fullname" -}}
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


{{- define "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.labels" -}}
helm.sh/chart: {{ include "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.chart" . }}
{{ include "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod3006f05-2f50-43d8-b77c-6caa7f7eb207.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}