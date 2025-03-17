
{{- define "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.fullname" -}}
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


{{- define "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.labels" -}}
helm.sh/chart: {{ include "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.chart" . }}
{{ include "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo393349c6-2d42-4b30-95b6-2bc65aad382e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}