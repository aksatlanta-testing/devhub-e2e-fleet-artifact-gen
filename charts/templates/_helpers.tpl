
{{- define "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.fullname" -}}
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


{{- define "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.labels" -}}
helm.sh/chart: {{ include "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.chart" . }}
{{ include "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoda86e687-21c5-469e-bd1f-b898599d4bde.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}