
{{- define "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.fullname" -}}
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


{{- define "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.labels" -}}
helm.sh/chart: {{ include "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.chart" . }}
{{ include "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo92910930-6ac2-4f1f-b4a4-5d5953edd662.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}