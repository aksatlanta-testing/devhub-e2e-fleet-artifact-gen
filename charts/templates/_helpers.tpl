
{{- define "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.fullname" -}}
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


{{- define "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.labels" -}}
helm.sh/chart: {{ include "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.chart" . }}
{{ include "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo34851876-2b3f-40c4-b747-e2de59eb5c17.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}