
{{- define "go-echo1368677f-a993-4c64-a217-76287abf6fae.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1368677f-a993-4c64-a217-76287abf6fae.fullname" -}}
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


{{- define "go-echo1368677f-a993-4c64-a217-76287abf6fae.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1368677f-a993-4c64-a217-76287abf6fae.labels" -}}
helm.sh/chart: {{ include "go-echo1368677f-a993-4c64-a217-76287abf6fae.chart" . }}
{{ include "go-echo1368677f-a993-4c64-a217-76287abf6fae.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1368677f-a993-4c64-a217-76287abf6fae.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1368677f-a993-4c64-a217-76287abf6fae.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}