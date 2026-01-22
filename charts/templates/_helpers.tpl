
{{- define "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.fullname" -}}
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


{{- define "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.labels" -}}
helm.sh/chart: {{ include "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.chart" . }}
{{ include "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc84d9881-d1ba-4f17-a9f6-523e60088c10.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}