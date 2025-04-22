
{{- define "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.fullname" -}}
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


{{- define "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.labels" -}}
helm.sh/chart: {{ include "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.chart" . }}
{{ include "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9f1fe1ce-c8bc-42b1-b9c3-eed9ad5e9ada.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}