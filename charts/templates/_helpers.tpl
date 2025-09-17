
{{- define "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.fullname" -}}
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


{{- define "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.labels" -}}
helm.sh/chart: {{ include "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.chart" . }}
{{ include "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0890e57b-41f6-4b6f-a786-758d4a4c8bcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}