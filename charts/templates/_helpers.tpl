
{{- define "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.fullname" -}}
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


{{- define "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.labels" -}}
helm.sh/chart: {{ include "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.chart" . }}
{{ include "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoed509f0a-87b0-464e-83f0-b4f5edf951bf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}