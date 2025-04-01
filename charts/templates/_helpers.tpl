
{{- define "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.fullname" -}}
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


{{- define "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.labels" -}}
helm.sh/chart: {{ include "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.chart" . }}
{{ include "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo93883a20-097d-4cab-b255-0c0426bf41ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}