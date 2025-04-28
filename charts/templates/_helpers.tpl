
{{- define "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.fullname" -}}
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


{{- define "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.labels" -}}
helm.sh/chart: {{ include "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.chart" . }}
{{ include "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo19c4baeb-f18e-4f8d-a93e-db79b0f56bb0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}