
{{- define "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.fullname" -}}
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


{{- define "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.labels" -}}
helm.sh/chart: {{ include "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.chart" . }}
{{ include "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5156abdd-994a-4412-9be2-a8423bbe846d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}