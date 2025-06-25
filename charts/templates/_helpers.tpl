
{{- define "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.fullname" -}}
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


{{- define "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.labels" -}}
helm.sh/chart: {{ include "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.chart" . }}
{{ include "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c73464c-99c7-437f-8539-95bb60e3aece.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}